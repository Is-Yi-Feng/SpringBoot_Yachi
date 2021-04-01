$(function(){   

    //可以把css包成class 寫在css檔裡面，利用addClass 與 removerClass 有效縮減程式碼
    //考慮之後還會更改，目前先暫時寫在這邊 2/10 
    //使用此方式，還是會出現上述程式的問題(重整後卷軸不在上方卻還是跑出全部hearder，後來發現是瀏覽器問題)

    $(window).scroll(function(){
        //卷軸在頂部時scroll會=0 ，故只要判斷是否為0即可，做出header一捲動就變化的效果
        let scroll = $(window).scrollTop();
//        console.log(scroll);
        if(scroll >= 1){
            $('.myNav, .search').css({
//                opacity:'0',  //會佔空間
//				display:none,
				position: 'absolute',
				top:'-9999px',
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
            $('.myNav, .search').css({   
                transition:'.5s',
                opacity:'1',
                position: 'static',  //復原定位屬性
//				  display:flex,
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
        
        
        // 取得元素在網頁的位置(x與y座標)
        let offestX = $(this).offset().left;
        // console.log("x = " + offestX);
        // let offestY = $(this).offset().top;
        // console.log("y = " + offestY);

        /* 讓上面和下面相應的索引號 eq() 顯示內容 
            其餘siblings() 隱藏起來 */
            // stop()  沒有加好像效果一樣???
        $('.tab-panel').eq(index).stop().fadeIn('slow').show().siblings().hide();
		 // 讓context可以在摸到的元素正下方
        $('.tab-content').css({
            left:`${offestX}px`,
        })
	
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
    
    //跑馬燈
    // 每三秒執行一次
			setInterval(function() {
				$('#news li:first-child').slideUp(function() {

					$('#news li:first-child').appendTo($('#news')).slideDown();
				});

			}, 3000);

})