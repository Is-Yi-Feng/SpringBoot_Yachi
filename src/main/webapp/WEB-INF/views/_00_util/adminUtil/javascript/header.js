$(function(){       
    
    // 鼠標下滾，header消失(還有bug，當f5 無法判斷header是否top=0)
    // $(document).on('mousewheel DOMMouseScroll',function(e){
    //    //判斷鼠標是向下還是向上(藉由e.originalEvent.wheelDelta)，正值向上負值向下
    //     let delta = (e.originalEvent.wheelDelta &&
    //                      (e.originalEvent.wheelDelta > 0 ? 1 : -1)) ||  // chrome & ie &其它
    //     (e.originalEvent.detail && (e.originalEvent.detail > 0 ? -1 : 1));  // firefox
    //     // console.log(e);
    //     // console.log(delta);
    //     //向上滾
    //     if(delta > 0){
    //         //當向上滾時，必須把.tab 的設定值恢復成預設值，否則會無法呈現原本樣子
    //         if($('header').offset().top === 0){
    //             $('.tab').css({
    //                 position:'static',
    //                 backgroundColor:'transparent',
    //                 boxShadow:'none',
    //             })
    //             //因為是針對nav, .search變透明
    //             //所以往上滾時，對象也要針對它們，而不是header標籤 
    //             $('nav, .search').css({   
    //             transition:'.5s',
    //             opacity:'1',
    //             });
    //         }
    //     //向下滾
    //     }else if(delta < 0){
    //         $('nav, .search').css({
    //             opacity:'0',
    //             transition:'.2s'
    //         });
    //         $('.tab').css({
    //             width:'100%',
    //             position:'absolute', //須為absolute 才能top=0 
    //             top:'0',
    //             backgroundColor:'rgba(255,255,255,0.9)',
    //             boxShadow:'2px 2px 2px 1px rgba(0, 0, 0, 0.1)',
    //         })
            
    //     }
    // })

    // // jQ入口函數會自動觸發
    // $('html').scrollTop(0);


    //可以把css包成class 寫在css檔裡面，利用addClass 與 removerClass 有效縮減程式碼
    //考慮之後還會更改，目前先暫時寫在這邊 2/10 
    //使用此方式，還是會出現上述程式的問題(重整後卷軸不在上方卻還是跑出全部hearder)

    $(window).scroll(function(){
        //卷軸在頂部時scroll會=0 ，故只要判斷是否為0即可，做出header一捲動就變化的效果
        let scroll = $(window).scrollTop();
        console.log(scroll);
        if(scroll >= 1){
            $('nav, .search').css({
                opacity:'0',
                transition:'.2s'
                });
            $('.tab').css({
                width:'100%',
                position:'absolute', //須為absolute 才能top=0 
                top:'0',
                backgroundColor:'rgba(255,255,255,0.9)',
                boxShadow:'2px 2px 2px 1px rgba(0, 0, 0, 0.1)',
            })
        }else{
            $('.tab').css({
                position:'static',
                backgroundColor:'transparent',
                boxShadow:'none',
            })
            //因為是針對nav, .search變透明
            //所以往上滾時，對象也要針對它們，而不是header標籤 
            $('nav, .search').css({   
                transition:'.5s',
                opacity:'1',
            });
        }
    })


     /* hover事件切換 如果只寫一個方法  
       那鼠標經過和離開都會觸發這個方法 slideToggle
    */
   
    // $('.menu-box').hover(function(){
    //     $(this).children('ul').slideToggle();
    // })

    $('.tab-list a').hover(function(){
        /* 為匹配的當前元素切換 class css類別 */
        $(this).toggleClass('liColor');
        
        /* 拿到當前(this) a 的索引號 */
        index = $(this).index();

        /* 讓上面和下面相應的索引號 eq() 顯示內容 
            其餘siblings() 隱藏起來 */
            // stop()  沒有加好像效果一樣???
        $('.tab-panel').eq(index).stop().fadeIn('slow').show().siblings().hide();

    },function(){
        /* 第二個方法處理滑鼠移開事件 */
        $(this).removeClass('liColor');
        $('.tab-panel').hide();
    })


    // 當鼠標移到出現的區塊時，區塊仍不會消失
    $('.tab-panel').hover(function(){
        index = $(this).index();
        $(this).css('background-color','white').show();
        $('.tab-list a').eq(index).addClass('liColor');
        },function(){
            $(this).hide();
            $('.tab-list a').eq(index).removeClass('liColor');
    })      
    

})