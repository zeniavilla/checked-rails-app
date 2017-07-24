function Chore(attributes) {
        this.title = attributes.title;
        this.id = attributes.id;
        this.frequencyAmount = attributes.frequency_amount;
        this.frequencyInterval = attributes.frequency_interval;
        this.durationEndDate = attributes.duration_end_date;
        this.user = { 'name': attributes.user.name };
        this.category = { 'id': attributes.category.id, 'title': attributes.category.title };
}

Chore.success = function(json) {
    setChoreHandlebarsTemplate();

    if (!$(".choreid-" + json.id).length) {
        var chore = new Chore(json)
        
        var choreTd = chore.renderTd()

        $('table').append(choreTd)
        $('#new_chore')[0].reset()
        $('.js-add-chore i').removeClass('green-background')
    }
}

Chore.error = function(response) {
    console.log("Broken", response)
}

$(function() {
    newChore();
});

var setChoreHandlebarsTemplate = () => {
    Chore.templateSource = $('#chore-template').html();

    Chore.prototype.renderTd = function() {
        return HandlebarsTemplates['chores/index'](this);
    }
}

var newChore = () => {
    formButtonOnInput();

    $("form#new_chore").on('submit', function(event) {
        event.preventDefault();
        var params = $(this).serialize();
        var action = this.action;
        
        $.ajax ({
            url: action,
            method: 'POST',
            data: params,
            dataType: 'json'
        })
        .success(Chore.success)
        .error(Chore.error);
    });
}

var formButtonOnInput = () => {
    $('#chore_title').on('input',function(e){
        if ($('#chore_title').val().length) {
            $(".js-add-chore i").addClass('green-background');
        } else {
            $('.js-add-chore i').removeClass('green-background');
        }
    });
}