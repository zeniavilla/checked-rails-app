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
            json.forEach(function(obj) {
                
                if ($(".choreid-" + obj.id).length === 0) {
                    var chore = new Chore(obj);
                    
                    var choreTd = chore.renderTd();

                    $('table').append(choreTd);
                    $('.js-chores-title').text('All Chores')
                }
            });
        })
        .error(function(response) {
            console.log("Broken", response)
        });
    });
}