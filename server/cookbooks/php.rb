# epelレポジトリ追加
execute "add yum epel" do
  user "root"
  command " yum -y install epel-release"
end

# remiレポジトリ追加
execute "add yum remi" do
  user "root"
  command <<-EOL
    wget http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
    rpm -ivh ./remi-release-7.rpm
  EOL
end

# php7をインストール
execute "php70" do
  user "root"
  command "yum -y --enablerepo=remi-php70 install php php-pear php-devel php-mbstring php-mysql php-pdo php-xml php-mcrypt php-intl"
end

## php5系を使うときは下記でいけるけど5.6を入るようにしたい
# php.iniのバックアップ
#execute 'php.ini backup' do
#    command 'cp /etc/opt/remi/php70/php.ini /etc/opt/remi/php70/php.ini.backup'
#end

# PHPのインストール
#package 'php'

# PHPのプラグインをインストール
#package 'php-mysqlnd php-gd php-intl php-mbstring'

# php.iniのバックアップ
#execute 'php.ini backup' do
#    command 'cp /etc/php.ini /etc/php.ini.backup'
#end
