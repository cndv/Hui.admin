<?php
namespace app\admin\controller;
use think\Controller;
use think\Request;
use think\Session;
use think\Db;
use think\Config;
use app\admin\model\User as UserModel;

/**
 * 系统登录控制器
 * Class Login
 * @package app\admin\controller
 */
class Login extends Controller{

    public function index(){
        return $this->fetch();
    }

    /**
     * 登录信息验证
     * @param Request $request
     * @return \think\response\Json
     */
    public function checkLogin(Request $request){
        if($request->isPost()){
            $data = $request->post();
            // 数据验证
            $result = $this->validate($data, 'Login');
            
            if(true !== $result){
                return json(['info' => $result]);
            }else{
                
                // 检测验证码
                if(!captcha_check($data['code'])){
                    return json(['info' => '验证码错误']);
                }
                $user = Db::name('user')->where(['username' => $data['name']])->find();
                // 设置session
                Session::set('uid', $user['id']);
                Session::set('uname', $user['username']);
                Session::set('loginip', $user['loginip']);
                Session::set('logintime', $user['logintime']);
                // 登录修改
                UserModel::where('id', $user['id'])->update([
                    'loginnumber' => $user['loginnumber'] + 1,
                    'logintime'   => time(),
                    'loginip'     => $request->ip(),
                ]);
                add_logs('登录系统', 1);
                return json([
                    'status' => 1,
                    'username' => $user['username'],
                    'url' => url('index/index')
                ]);
            }
        }else{
            die('非法操作！');
        }
    }

    // 发送登录邮件
    public function sendMailer(Request $request){
        $data = [
            'title'   => Config::get('websetup.sitename') . '管理系统登录通知邮件',
            'content' => '管理员：' . $request->post('username') . '，登录系统，时间：' . date('Y-m-d H:i:s'),
            'email'   => Config::get('websetup.email'),
            'file'    => null
        ];
        send_mailer($data);
    }

    // 退出系统
    public function logout(){
        if(Session::has('uid') && Session::has('uname')){
            add_logs('退出系统', 1);
            Session::delete('uid');
            Session::delete('uname');
            Session::clear();
            return hui_redirect('Login/index');
        }else{
            return hui_redirect('Login/index');
        }
    }

}
