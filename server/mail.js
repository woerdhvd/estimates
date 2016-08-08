import {Meteor}   from 'meteor/meteor'
import {Email}    from 'meteor/email'
import nodemailer from 'nodemailer'

/**
 * Get the url to send emails from
 */
if (Meteor.users.findOne())
{
	var {profile, email} = Meteor.users.findOne()

	process.env.MAIL_URL = profile.mailUrl

	Email.send({
		to: 'reinvanderwoerd@me.com',
		from: 'reinvanderwoerd@me.com',
		subject: "Example Email",
		text: "The contents of our email in plain text.",
	});

}
