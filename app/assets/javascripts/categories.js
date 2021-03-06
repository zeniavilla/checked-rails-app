$(function() {
    viewAllCategories();
});

function viewAllCategories() {
    $('.js-all-categories').on('click', function(event) {
        event.preventDefault();
        
        var path = event['currentTarget']['href']
        
        $.ajax({
            url: path,
            dataType: 'json',
            method: 'GET'
        })
        .success(function(json) {
            
            (json) ? json.forEach(Chore.success) : false;

            $('.js-chores-title').text('All Chores')
            addDeleteChoreIconListeners();
        })
        .error(Chore.error);
    });
}

function addDeleteChoreIconListeners() {
    $('button#delete_chore_icon').on('click', function(event) {
        event.preventDefault();
        
        var method = this.dataset.method;
        var path = this.dataset.url;
        var delete_link_row = $(this).parents('tr')
        
        $.ajax ({
            url: path,
            method: 'DELETE',
        })
        .success(function(response) {
            delete_link_row.remove();
        })
        .error(function(response) {
            console.log("Error", response)
        })
        

    })
}
