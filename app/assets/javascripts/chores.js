function Chore(attributes) {
        this.title = attributes.title;
        this.id = attributes.id;
        this.frequency_amount = attributes.frequency_amount;
        this.frequency_interval = attributes.frequency_interval;
        this.duration_end_date = attributes.duration_end_date;
}

$(function() {
    Chore.templateSource = $('#chore-template').html();
    Chore.template = Handlebars.compile(Chore.templateSource);

    Chore.template({title: 'Chore'})

    Chore.prototype.renderTd = function() {
        return Chore.template(this);
    }
})
    

$(function() {

    $("form").on('submit', function(event) {
        event.preventDefault();
        var params = $(this).serialize();
        var action = this.action;

        // var saving = $.post(action, params);
        // saving.done(function(data) {
        //     console.log(data)
        // })
        
        $.ajax ({
            url: action,
            method: 'POST',
            data: params,
            dataType: 'json'
        })
        .done(function(json) {
            var chore = new Chore(json);
            var choreTd = chore.renderTd();

            $('table tr').append(choreTd)
        });
    });
});