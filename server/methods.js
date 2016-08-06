import { Meteor } from 'meteor/meteor'
import { FormOptions } from '../collections/FormOptions'

Meteor.methods({

	swapOrder (a, b) {
		console.log(a, b)
		docA = FormOptions.findOne({order: a})
		docB = FormOptions.findOne({order: b})

		FormOptions.update(docA._id, {$set: {order: b}})
		FormOptions.update(docB._id, {$set: {order: a}})
	}


})
