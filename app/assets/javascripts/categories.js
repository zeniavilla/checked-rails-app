$(function() {
    $('.js-all-categories').on('click', function(event) {
        event.preventDefault();

        $.ajax({
            url: '/categories',
            dataType: 'json',
            method: 'GET'
        })
        .done(function(json) {
            json.forEach(function(obj) {
                    var chore = new Chore(obj);
                    // debugger
                    var choreTd = chore.renderTd();

                // if (!$("table:contains(" + obj.user.name + ")")) {
                    $('table').append(choreTd);
                // }
            });
        });
    });
});