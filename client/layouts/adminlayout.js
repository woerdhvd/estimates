import { Accounts } from 'meteor/accounts-base'
import { Template } from 'meteor/templating'
import './adminlayout.html'

Template.adminlayout.events({
    'click #logout' (event) {
        console.log('hello')
        event.preventDefault()
        Meteor.logout(() => {
            Router.go('/login')
        })
    }
})
