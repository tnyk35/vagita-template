# MySQL（MariaDB）インストール
package 'mariadb-server'


# my.cnfのバックアップ
execute 'server.cnf backup' do
    command 'cp /etc/my.cnf.d/server.cnf /etc/my.cnf.d/server.cnf.backup'
end

# MySQL起動、有効化
service 'mariadb' do
    action [:start, :enable]
end

# MySQL初期設定
execute "mysql_secure_installation" do
    user "root"
    only_if "mysql -u root -e 'show databases' | grep information_schema" # パスワードが空の場合
    command <<-EOL
        mysqladmin -u root password "1234"
        mysql -u root -p1234 -e "DELETE FROM mysql.user WHERE User='';"
        mysql -u root -p1234 -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1');"
        mysql -u root -p1234 -e "DROP DATABASE test;"
        mysql -u root -p1234 -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"
        mysql -u root -p1234 -e "FLUSH PRIVILEGES;"
    EOL
end
