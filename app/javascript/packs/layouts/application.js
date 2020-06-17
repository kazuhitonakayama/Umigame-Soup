(function(){
    const $header = document.querySelector('.header');
    //addEventListener：イベント処理（click）
    $header.addEventListener('click', function(){
      //ON時はis-activeクラス付与、OFF時はis-activeクラス削除
      $header.classList.toggle('is-active')
    });
})();