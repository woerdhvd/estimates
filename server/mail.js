import {Meteor} from 'meteor/meteor'
import {Email}    from 'meteor/email'
import dateFormat from 'dateformat'
import {calculateCost} from '../utils'

/**
 * Template helpers
 */
const helpers =
{
	calculateCost,
	dateFormat: date => dateFormat(date, "fullDate")
}


export function getUserEmail ()
{
	const {profile, emails} = Meteor.users.findOne()
	const email   = emails[0].address
	const mailUrl = profile.mailUrl

	process.env.MAIL_URL = mailUrl
	return {mailUrl, email}
}


/**
* Notify the user of a new estimate.
*/
export function sendNotification (email, estimate)
{
	Email.send({
		from: email,
		to: email,
		subject: 'Aanvraag prijsopgave website',
		html: renderTemplate('notification', helpers, estimate)
	})
}

/**
 * Send a confirmation email to the customer.
 * The customer isn't able to see the cost of options.
 */
export function sendConfirmation (email, estimate)
{
	Email.send({
		from: email,
		to: estimate.email,
		subject: 'Aanvraag prijsopgave website',
		html: renderTemplate('confirmation', helpers, estimate)
	})
}


/**
 * Renders a template using the given helpers and
 * data context.
 */
function renderTemplate (name, helpers, context)
{
	SSR.compileTemplate(name, Assets.getText(`${name}.html`))
	Template[name].helpers(helpers)
	return SSR.render(name, context)
}
