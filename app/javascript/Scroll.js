let img = document.querySelector('#slider')
let cont = document.querySelector('.conteiner_1')

window.addEventListener('scroll', Scroll)

function Scroll (){
    let imgHeight = img.offsetHeight / 2;
    let scrollTop = window.scrollY;
    let windWid = window.innerWidth;

    if (scrollTop >= imgHeight){
        cont.classList.add('fixed_cont_1');
    }
    if (scrollTop <= imgHeight || windWid < screenWidth / 2)
    {
        cont.classList.remove('fixed_cont_1');
    }
}