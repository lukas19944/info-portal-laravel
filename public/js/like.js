
function auth(auth_user){

    if (auth_user){
        addLike();
    }else{
        alert('You must log in')
    }
}





    function addLike() {
        $(document).ready(function () {

            $('.like').on('click', function (event) {
                event.preventDefault();
                object=event.target.classList[1];

                id = event.target.dataset['id'];

                var isLike = event.target.previousElementSibling == null ? 1 : 0;
                var i = event.target.querySelector('i');
                var value = i.classList.value;

                sibling = event.target.previousElementSibling == null ? event.target.nextElementSibling : event.target.previousElementSibling;


                $.ajax({
                    method: 'POST',
                    url: urlLike,
                    data: {isLike: isLike, id: id, _token: token},

                })
                    .done(function () {
                        if (isLike) {
                            if (value == 'fa fa-thumbs-o-up') {
                                i.classList.remove('fa-thumbs-o-up');
                                i.classList.add('fa-thumbs-up');
                                sibling.children[0].classList.remove('fa-thumbs-down');
                                sibling.children[0].classList.add('fa-thumbs-o-down');
                            } else {
                                i.classList.remove('fa-thumbs-up');
                                i.classList.add('fa-thumbs-o-up');
                            }
                        } else {
                            if (value == 'fa fa-thumbs-o-down') {
                                i.classList.remove('fa-thumbs-o-down');
                                i.classList.add('fa-thumbs-down');
                                sibling.children[0].classList.remove('fa-thumbs-up');
                                sibling.children[0].classList.add('fa-thumbs-o-up');
                            } else {
                                i.classList.remove('fa-thumbs-down');
                                i.classList.add('fa-thumbs-o-down');
                            }
                        }


                    });


            });
        });
    }






