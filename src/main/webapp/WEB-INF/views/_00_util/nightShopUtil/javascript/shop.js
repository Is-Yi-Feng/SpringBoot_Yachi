$(document).ready(function(){
    divWidth = $('#sliderBoard').width();
    divHeight = $('#sliderBoard').height();
    // '#content li' 會找到很多個，是陣列，要.length
    let imgCount = $('#content li').length;
    // alert(imgCount);

    //有幾張照片就要在#contentButton新增幾個  li標籤
    for(let i = 0; i < imgCount; i++){
        $('#contentButton').append('<li></li>');
    }
    //新增標籤後給#contentButton li 第一個小孩class=clickMe
    $('#contentButton li:nth-child(1)').addClass('clickMe');

    $('#content li').width(divWidth);
    // 當要往左邊推跟index有關 (第三章就是往前推兩張) 是ul要往左邊推
    $('#content').width(divWidth * imgCount);

    setAutoPlay();

    let index = 0;
    $('#contentButton li').click(function(){
        // alert($(this).index());
        // alert(divWidth * index);
        index = $(this).index();

        $('#content').animate({
            left: divWidth * index * -1,
        });

        //點到的每一個都變顏色(加上class=clickMe)
        $(this).addClass('clickMe');
        //其他的移除class=clickMe
        $('#contentButton li').not(this).removeClass('clickMe');
    });
    

    $('#sliderLeft').click(function(){
        if(index < 1){
            return;
        }else{
            // alert($(this).index());
            index = index - 1;
    
            $('#content').animate({
                left: divWidth * index * -1,
                
            });
    
            //點到的每一個都變顏色(加上class=clickMe)
            $('#contentButton li').slice(index,index + 1).addClass('clickMe');
            // $('#contentButton li').eq(index).addClass('clickMe');

            //其他的移除class=clickMe
            $('#contentButton li').not($('#contentButton li').slice(index, index + 1)).removeClass('clickMe');
            // $('#contentButton li').not($('#contentButton li').eq(index)).removeClass('clickMe');
        }
    });

    $('#sliderRight').click(function(){
        if(index < $('#contentButton li').length -1){
            // alert($(this).index());
            index = index + 1;
    
            $('#content').animate({
                left: divWidth * index * -1,
            });
    
            //點到的每一個都變顏色(加上class=clickMe)
            $('#contentButton li').slice(index,index + 1).addClass('clickMe');
            //其他的移除class=clickMe
            $('#contentButton li').not($('#contentButton li').slice(index, index + 1)).removeClass('clickMe');
        }else{
            return;
        }
    });
    function setAutoPlay(){
        return setInterval(() => {

                index = index + 1;
                if(index > $('#contentButton li').length -1){
                    index = 0;
                }
                $('#content').animate({
                    left: divWidth * index * -1,
                });
        
                //點到的每一個都變顏色(加上class=clickMe)
                $('#contentButton li').slice(index,index + 1).addClass('clickMe');
                //其他的移除class=clickMe
                $('#contentButton li').not($('#contentButton li').slice(index, index + 1)).removeClass('clickMe');
            
        },3000);
    }
    
});
