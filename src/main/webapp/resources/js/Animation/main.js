$(function () {
    /*
     -본문의 이미지가 로드 되는 상황을 모니터
      - 진행률에 따라 막대늘어나야, 숫자 변경,
       - 이미지 모두 로드되면 진행률 100%면, 모니터링을 중지하고 검은화면이 위로 올라ㅏ감
    */
        var $container = $('#progress'),
            $progressBar = $container.find('.progress-bar'),
            $progressText = $container.find('.progress-text'),
    
            imgLoad = imagesLoaded('body');
            imgTotal = imgLoad.images.length, //전체 이미지 개수
            imgLoaded = 0, // 로드한 이미지 수 
            current = 0, // 진행률 
            
            progressTimer = setInterval(updateProgress, 1000/60);
    
            // 이미지들 로드할 때 마다 로드한 이미지 수를 늘려준다.
    
            imgLoad.on('progress', function(){
                imgLoaded++;
                console.log(imgLoaded);
            });
    
            function updateProgress(){
                //진행률 -> bar, 숫자 100/192 * 100
                var target = (imgLoaded/imgTotal) *100;
                
                current += (target - current) * 0.01;
    
                console.log(target);
                $progressBar.css({width:current + '%'});
                $progressText.text(Math.floor(current) + '%');
    
                if(current > 99.9){
                    clearInterval(progressTimer);
                    $container.addClass('progress-complete');
                    $progressBar.add($progressText).delay(500).animate({opacity:0},250, function(){
                        $container.animate({top:'-100%'},1000,'easeInOutQuint');
                    });
                }
            }//updateProgress
    
    }); // document ready
    