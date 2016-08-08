import { Accounts } from 'meteor/accounts-base'
import { Template } from 'meteor/templating'
import './login.html'

Template.login.helpers({

})

Template.login.events({
    // Form validation here...

    'submit form' (event) {
        event.preventDefault()
        Meteor.loginWithPassword($('#username').val(), $('#password').val(), (err) => {
            if (!err) Router.go('/admin/estimates')
        })
    }
})
