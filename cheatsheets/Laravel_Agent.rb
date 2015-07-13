cheatsheet do
    title 'Laravel Agent'
    docset_file_name 'Laravel_Agent'
    keyword 'laravelagent'
    source_url 'https://phphub.org/topics/782'
    introduction <<-'END'
    [Laravel Agent](https://github.com/jenssegers/laravel-agent) 是一个为 Laravel 定制的客户端识别扩展包，基于 [Mobile Detect](https://github.com/serbanghita/Mobile-Detect)，提供了非常优雅的接口。
    END

    category do
        id '安装'

        entry do
            name '使用 composer 安装:'
            notes "
            ```php
            composer require jenssegers/agent
            ```"
        end

        entry do
            name '修改 app/config/app.php 添加 ServiceProvider :'
            notes "
            ```php
            'Jenssegers\Agent\AgentServiceProvider',
            ```"
        end

        entry do
            name '修改 app/config/app.php 添加 alias:'
            notes "
            ```php
            'Agent' => 'Jenssegers\Agent\Facades\Agent'
            ```"
        end
    end

    category do
        id '基础用法'

        entry do
            name '操作系统'
            notes "
            ```php
            Agent::is('Windows');
            Agent::is('Firefox');
            Agent::is('iPhone');
            Agent::is('OS X');
            ```"
        end

        entry do
            name '厂商产品定位'
            notes "
            ```php
            Agent::isAndroidOS();
            Agent::isNexus();
            Agent::isSafari();
            ```"
        end

        entry do
            name '设备类型'
            notes "
            ```php
            Agent::isMobile();
            Agent::isTablet();
            Agent::isDesktop();
            ```"
        end

        entry do
            name '语言'
            notes "
            ```php
            $languages = Agent::languages();
            // ['nl-nl', 'nl', 'en-us', 'en']
            ```"
        end

        entry do
            name '是否是机器人'
            notes "
            ```php
            Agent::isRobot();
            ```"
        end

        entry do
            name '获取设备信息 '
            notes "
            ```php
            Agent::device();
            // iPhone, Nexus, AsusTablet, ...
            ```"
        end

        entry do
            name '系统信息'
            notes "
            ```php
            Agent::platform();
            // Ubuntu, Windows, OS X, ...
            ```"
        end

        entry do
            name '浏览器信息'
            notes "
            ```php
            Agent::browser();
            // Chrome, IE, Safari, Firefox, ...
            ```"
        end

        entry do
            name '获取浏览器版本'
            notes "
            ```php
            $browser = Agent::browser();
            $version = Agent::version($browser);
            ```"
        end

        entry do
            name '获取系统版本'
            notes "
            ```php
            $platform = Agent::platform();
            $version = Agent::version($platform);
            ```"
        end
    end

    category do
        id '举个栗子'

        entry do
            name '下面是一段微信扫一扫下载 App 的链接的逻辑'
            notes <<-'END'
            ```php
            $android_download_link = 'http://7xim5a.com2.z0.glb.qiniucdn.com/app.apk';
            $weichat_download_link = 'http://a.app.qq.com/o/simple.jsp?pkgname=com.app.indentifior';
            $ios_download_link     = 'https://itunes.apple.com/cn/app/kou-yu-jiao-er/app-id*?l=en&mt=8';
            $download_link         = '';

            // 如果是移动端访问的话 (phones or tablets).
            if ( Agent::isMobile() )
            {
                if( Agent::isiOS() )
                {
                    $download_link = $ios_download_link;
                    // 微信访问
                    if (strpos(Agent::getUserAgent(), 'MicroMessenger') !== false)
                    {
                        // echo "<h1>微信用户若不能安装, 请点击右上角的跳转按钮, 选择 \"在 Safari 中打开\" 即可正常跳转哦 ^_^ .</h1>";
                        // exit;
                        $download_link = $weichat_download_link;
                    }
                }
                if( Agent::isAndroidOS() )
                {
                    $download_link = $android_download_link;
                    // 微信访问
                    if (strpos(Agent::getUserAgent(), 'MicroMessenger') !== false)
                    {
                        // 使用应用宝可以访问
                        $download_link = $weichat_download_link;
                    }
                }
            }
            END
        end

        entry do
            name 'View'
            notes <<-'END'
            ```html
            <!doctype html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <title></title>
            </head>
            <body>
                <h1>处理中... </h1>

                <script type="text/javascript">
                    window.onload=function(){
                      setTimeout("window.location.href='<?php echo $downloadlink; ?>'",1000);
                    }
                </script>

            </body>
            </html>
            END
        end

        entry do
            name ''
            notes "
            ```php
            ```"
        end
    end
end
