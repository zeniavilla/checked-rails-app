$(function() {
    viewAllCategories();
});

var viewAllCategories = () => {
    $('.js-all-categories').on('click', function(event) {
        event.preventDefault();
        var path = event['currentTarget']['href']
        
        $.ajax({
            url: path,
            dataType: 'json',
            method: 'GET'
        })
        .success(function(json) {
            json.forEach(Chore.success);

            $('.js-chores-title').text('All Chores')
        })
        .error(Chore.error);
    });
}