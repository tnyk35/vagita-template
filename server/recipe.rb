# レシピでやることまとめ
# 1.apacheインストール
# 2.phpインスト
# 3.mysqlインスト
# 4.cakephp3インスト
# 5.phpMyAdminのインスト

# timezone設定
execute 'set timezone' do
    user "root"
    command <<-EOL
        cp -p /usr/share/zoneinfo/Japan /etc/localtime
        echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock
        echo 'UTC=false' >> /etc/sysconfig/clock
    EOL
end

# firewalld停止,無効化
service 'firewalld' do
  action [:disable, :stop]
end


include_recipe "./cookbooks/apache.rb"
include_recipe "./cookbooks/php.rb"
include_recipe "./cookbooks/mysql.rb"
include_recipe "./cookbooks/phpmyadmin.rb"
#include_recipe "./cookbooks/cakephp.rb"

# Apache起動、有効化
service 'httpd' do
  action [:enable, :start]
end
