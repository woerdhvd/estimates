import {Accounts} from 'meteor/accounts-base'
import {Template} from 'meteor/templating'
import urlencode  from 'urlencode'
import './setup.html'

Template.setup.onCreated(function () {
	$('form').validate()
})

Template.setup.events({
		'submit form' (event) {
			event.preventDefault()

			const email 	 = urlencode($('#email').val())
			const password = $('#password').val()
			const host 		 = $('#host').val()
			const port 		 = $('#port').val()

			const mailUrl  = `smtp://${email}:${password}@${host}:${port}`

			Accounts.createUser({email, password, profile: {mailUrl}})
		}
})
