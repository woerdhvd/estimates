import { Meteor } from 'meteor/meteor'
import { FormOptions } from '../collections/FormOptions'
import {sendNotification, sendConfirmation} from './mail'

Meteor.startup(() => {

})

Meteor.methods({

	swapOrder (a, b) {
		docA = FormOptions.findOne({order: a})
		docB = FormOptions.findOne({order: b})

		FormOptions.update(docA._id, {$set: {order: b}})
		FormOptions.update(docB._id, {$set: {order: a}})
	},

	sendMail (estimate) {
		const {email} = getUserEmail()
		sendNotification(email, estimate)
		sendConfirmation(email, estimate)
	}


})
