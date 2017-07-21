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
                
                if ($(".choreid-" + obj.id).length === 0) {
                    var chore = new Chore(obj);
                    
                    var choreTd = chore.renderTd();

                    $('table').append(choreTd);
                    $('.js-chores-title').text('All Chores')
                }
            });
        });
    });
});