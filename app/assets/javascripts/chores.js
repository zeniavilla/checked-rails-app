function Chore(attributes) {
        this.title = attributes.title;
        this.id = attributes.id;
        this.frequencyAmount = attributes.frequency_amount;
        this.frequencyInterval = attributes.frequency_interval;
        this.durationEndDate = attributes.duration_end_date;
        this.userName = attributes.user.name;
        this.categoryId = attributes.category.id;
        this.categoryTitle = attributes.category.title;
}

$(function() {
    Chore.templateSource = $('#chore-template').html();
    Chore.template = Handlebars.compile(Chore.templateSource);

    Chore.template({title: 'Chore', categoryTitle: 'Cool', userName: 'Steve Jobs', durationEndDate: '2017-07-28T00:00:00.000Z', frequencyAmount: 2, frequencyInterval: 'days'})

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
            debugger
            var choreTd = chore.renderTd();

            $('table').append(choreTd)
        });
    });
});