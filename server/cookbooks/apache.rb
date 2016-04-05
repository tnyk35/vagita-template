# Apacheインストール
package 'httpd'

# httpd.confのバックアップ
execute 'httpd.conf backup' do
    command <<-EOS
    cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.backup
    cp /vagrant/server/cookbooks/templates/httpd.conf /etc/httpd/conf/httpd.conf
    EOS
end

