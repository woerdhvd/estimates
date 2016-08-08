import {Meteor} from 'meteor/meteor'
import {Email}    from 'meteor/email'
import dateFormat from 'dateformat'
import {calculateCost} from '../utils'

function getUserData ()
{
	const {profile, emails} = Meteor.users.findOne()
	const email   = emails[0].address
	const mailUrl = profile.mailUrl

	process.env.MAIL_URL = mailUrl
	return {mailUrl, email}
}


export function sendNotification (estimate)
{
	const {email} = getUserData()

	SSR.compileTemplate('notification', Assets.getText('notification.html'))

	Template.notification.helpers({
		estimatedCost: formOptions => calculateCost(formOptions),
		dateFormat: 	 date => dateFormat(date, "fullDate")
	})

	const html = SSR.render("notification", estimate)

	Email.send({from: email, to: email, subject: 'test', html})
}

export function sendConfirmation (estimate)
{
	const {email} = getUserData()

	SSR.compileTemplate('confirmation', Assets.getText('confirmation.html'))

	Template.confirmation.helpers({
		dateFormat: 	 date => dateFormat(date, "fullDate")
	})

	const html = SSR.render("confirmation", estimate)

	Email.send({from: email, to: estimate.email, subject: 'Aanvraag prijsopgave website', html})
}
