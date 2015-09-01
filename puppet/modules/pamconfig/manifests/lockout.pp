class pamconfig::lockout inherits pamconfig {
  pam { "Set deny invalid login attempts -fail system_auth":
    ensure              => present,
    service             => 'system-auth',
    type                => 'auth',
    control             => 'required',
    control_is_param    =>  true,
    module              => 'pam_faillock.so',
    arguments           => ['authfail', 'deny=3', 'unlock_time=600', 'preauth', 'silent', 'audit'],
    #position            => 'after *[type="auth" and module="pam_env.so"]',
    }
  pam { "Set deny invalid login attempts -fail password_auth":
    ensure              => present,
    service             => 'password-auth',
    type                => 'auth',
    control             => 'required',
    control_is_param    =>  true,
    module              => 'pam_faillock.so',
    arguments           => ['authfail', 'deny=3', 'unlock_time=600', 'preauth', 'silent', 'audit'],
    #position            => 'after *[type="auth" and module="pam_env.so"]',
    }
}
