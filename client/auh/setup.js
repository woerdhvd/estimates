import { Accounts } from 'meteor/accounts-base'
import { Template } from 'meteor/templating'
import './setup.html'

Template.setup.helpers({

})

Template.setup.events({
		// Form validation here...

		'submit form' (event) {
				event.preventDefault()
				Accounts.createUser({
						email: $('#email').val(),
						username: $('#username').val(),
						password: $('#password').val()
				})
		}
})
