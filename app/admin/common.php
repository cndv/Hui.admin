<?php
// 后台函数公共文件
use think\Db;
use think\Request;
use think\Config;
use think\Session;
use app\admin\model\User;
use app\admin\model\Attach;
use app\admin\model\Convert;
use app\admin\model\Export;
use app\admin\model\AuthGroup;
use app\admin\model\AuthGroupAccess;
use app\admin\model\Models;
use app\admin\model\Channel;

/**
 * [delete_model_data 删除文档自定义数据]
 * @param  [integer] $cid [栏目ID]
 * @param  [integer] $id  [文档ID]
 * @return [boolean]
 */
function delete_model_data($cid,$id){
    $result = Channel::get($cid);
    if($result){
        $mrs = Models::get($result['model']);
        if($mrs){
            model($mrs['table'])->where(['aid' => $id])->delete();
            return true;
        }else{
            return false;
        }
    }
}

/**
 * [delete_file 删除文件]
 * @param  [integer] $id [文件ID]
 * @return [boolean]
 */
function delete_file($id){
    $db = Attach::get($id);
    if($db){
        $url = HUI_FILES .$db->url;
        // 删除文件
        if(is_file($url)){
            chmod($url,0777);
            unlink($url);
        }
        // 删除缩略图
        if (!empty($db->thumb)) {
            $thumb = HUI_FILES .$db->thumb;
            if(is_file($thumb)){
                chmod($thumb,0777);
                unlink($thumb);
            }
        }
        // 删除文件数据
        $result = $db->delete();
        return $result ? true : false;
    }
}

/**
 * [delete_conversion 删除转换文件]
 * @param  [integer] $id [文件ID]
 * @return [boolean]
 */
function delete_conversion($id){
    $db = Convert::get($id);
    if($db){
        // 删除文件
        $url = HUI_FILES.$db->url;
        if(is_file($url)){
            chmod($url,0777);
            unlink($url);
        }
        $result = $db->delete();
        return $result ? true : false;
    }
}

/**
 * [delete_export 删除导出文件]
 * @param  [integer] $id [文件ID]
 * @return [boolean]
 */
function delete_export($id){
    $db = Export::get($id);
    if($db){
        // 删除文件
        $url = HUI_FILES.$db->url;
        if(is_file($url)){
            chmod($url,0777);
            unlink($url);
        }
        $result = $db->delete();
        return $result ? true : false;
    }
}

/**
 * [get_username 获取管理员账号]
 * @param  [integer] $uid [用户ID]
 * @return [string]
 */
function get_username($uid){
	$result = User::get($uid);
    return $result ? $result['username'] : '未知';
}

/**
 * [get_user_role 获取管理员角色]
 * @param  [string] $uid [管理员ID]
 * @return [string]
 */
function get_user_role($uid = ''){
    if(!empty($uid)){
        $result = AuthGroupAccess::getByUid($uid);
        $AuthGroup = AuthGroup::get($result['group_id']);
        return $AuthGroup['title'];
    }else{
        return '';
    }
}

/**
 * [system_logs 记录系统日志]
 * @param  [string] $operate  [操作]
 * @param  [string] $username [管理员]
 * @param  [integer] $status   [状态 0失败 1成功]
 * @return [boolean]
 */
function system_logs($operate,$username,$status){
	if(Config::get('websetup.logs') == 1){
		Db::name('logs')->insert([
            'username' => $username,
            'ip'       => Request::instance()->ip(),
            'operate'  => $operate,
            'status'   => $status,
            'time'     => time()
        ]);
	}
    return true;
}

/**
 * [parse_config_attr 分析枚举类型配置值 格式 a:名称1,b:名称2]
 * @param  [string] $string [字符串]
 * @return [array]         [数组]
 */
function parse_config_attr($string){
    $array = preg_split('/[,;\r\n]+/', trim($string, ",;\r\n"));
    if(strpos($string,':')){
        $value  =   [];
        foreach ($array as $val) {
            list($k, $v) = explode(':', $val);
            $value[$k]   = $v;
        }
    }else{
        $value  =   $array;
    }
    return $value;
}

/**
 * [breadcrumb 生成面包屑函数]
 * @param  [array] $arr [面包屑参数]
 * @return [string]      [面包屑]
 */
function breadcrumb($arr){
    $str = '<a onClick="removeIframe();" href="javascript:;"><i class="Hui-iconfont">&#xe67f;</i> 首页</a>';
    foreach($arr as $key => $value){
    	$str .= '<span class="c-gray en">&gt;</span>'.$value;
    }
    return $str; 
}

/**
 * [is_login 检测登录状态]
 * @return [boolean]
 */
function is_login(){
    if(Session::has('uid') && Session::has('uname')){
        return true;
    }else{
        return false;
    }
}

/**
 * [get_model_name 获取模型名称]
 * @param  [integer] $mid [模型ID]
 * @return [string]      [模型名称]
 */
function get_model_name($mid){
    if($mid == -1){
        return "外部导航";
    }
    $result = Models::get($mid);
    return $result ? $result['name'] : '未知';  
}

/**
 * [get_channel_model_name 根据栏目ID获取模型名称]
 * @param  [integer] $cid [模型ID]
 * @return [string]      [模型名称]
 */
function get_channel_model_name($cid){
    $channel = Channel::get($cid);
    if($channel['model'] == -1){
        return "外部导航";
    }else{
        $result = get_model_name($channel['model']);
        return $result ? $result : '未知';
    }
}

/**
 * [get_channel 获取无限极栏目信息]
 * @param  [integer] $pid  [主栏目ID]
 * @param  [string] $path [路径符号]
 * @return [array]
 */
function get_channel($pid,$path){
    global $c_arr;
    $db = new Channel();
    //读取数据
    $list = $db->where(['pid' => $pid])->order('pid,sorting')->select();
    if (is_array($list)){
        foreach($list as $val){
            if ($val["pid"] == $pid){
                if ($val["pid"] == 0){
                    $c_arr[] = ["id" => $val["id"],"pid" => $val["pid"],"cname" => $val["cname"],"mname" => $val["mname"],"model" => $val["model"],"outurl" => $val["outurl"],"sorting" => $val["sorting"],"keywords" => $val["keywords"],"describle" => $val["describle"],"status" => $val["status"],"update_time" => $val["update_time"]];
                }else{
                    $c_arr[] = ["id" => $val["id"],"pid" => $val["pid"],"cname" => $path.$val["cname"],"mname" => $val["mname"],"model" => $val["model"],"outurl" => $val["outurl"],"sorting" => $val["sorting"],"keywords" => $val["keywords"],"describle" => $val["describle"],"status" => $val["status"],"update_time" => $val["update_time"]];
                }
                get_channel($val["id"],"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$path);
            }
        }
    }
    return $c_arr;
}