$(function () {
    $('#tab_nav a').click(function(){ 
        // 當點擊tabs-nav的元素a時  替當前(this)的a超連結增加.tab_selected類  
        // 其餘兄弟類 siblings() remove .change類
        $(this).addClass('tab_selected').siblings().removeClass('tab_selected');

        // 點擊的同時 拿到當前 a 超連結的索引號
        let index = $(this).index();     //  index從0開始
        // console.log(index);

        // 讓下面對應的索引號  .tabs-content 的子元素.tabs-panel[index] 渲染出來  
        // 其他 子元素 兄弟類 siblings() 的 .tabs_panel 隱藏
        // 找出 panel 的 index 對應到 #tab_nav a 的 index
        $('.tabs_content .tabs_panel').eq(index)  
        .addClass('show_panel animated_tabs product_comment').show().siblings().hide();

    });


    // $('.doMore').on('click',function(e){
    //     e.preventDefault();
    //     $(this).toggleClass('active')
    //     $('.jq-dropdown').slideToggle();
    // })




});

