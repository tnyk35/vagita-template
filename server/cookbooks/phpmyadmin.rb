# phpMyAdminインストール
#package 'phpMyAdmin'
execute 'phpMyAdmin' do
    command "yum --enablerepo=remi-php70 -y install phpmyadmin"
end

# phpMyAdmin.confのバックアップ
execute 'phpMyAdmin.conf backup' do
    command 'cp /etc/httpd/conf.d/phpMyAdmin.conf /etc/httpd/conf.d/phpMyAdmin.conf.backup'
end

# phpMyAdmin.confの設定
file '/etc/httpd/conf.d/phpMyAdmin.conf' do
    action :edit
    block do |content|
        content.gsub!("Allow from ::1", "Allow from ::1\n     Allow from 192.168.")
        content.gsub!("Require ip ::1", "Require ip ::1\n     Require ip 192.168.")
    end
end
