import { Accounts } from 'meteor/accounts-base'
import { Template } from 'meteor/templating'

import sortable from 'html5sortable'
import { SubOption, FormOption, FormOptions } from '../../collections/FormOptions'
import { uid, updateProperty } from '../../utils'


/**
 * Reorder FormOptions
 */

function reload ()
{
	sortable('#form-options')[0].addEventListener('sortupdate', updateOrder)
}


function updateOrder ({detail})
{
	Meteor.call('swapOrder', detail.index, detail.oldindex)
}

Template.form.rendered = reload

Template.form.helpers({
	formoptions: _ => FormOptions.find({}, {sort: {order: 1}})
})


Template.form.events({

	/**
	 * Add/Remove
	 */
	'click .new' () {
		FormOptions.insert(new FormOption(FormOptions.find().count()))
		reload()
	},

	'click .remove' (e) {
		let id         = $(e.target).parent().attr("data-id")
		FormOptions.remove(id)
		reload()
	},

	/**
	 * Update
	 */
	'keyup .form-option > input, keyup .form-option > textarea' (e, t) {
		let id         = $(e.target).parent().attr("data-id")
		let key        = $(e.target).attr("class")
		let value      = $(e.target).val()

		if (key == 'cost') value = Number(value)

		FormOptions.update(id, {$set: {[key]: value}})
	},


	/**
	 * SubOption Add/Remove
	 */
	'click .add-suboption' (e) {
		let id         = $(e.target).parent().attr("data-id")
		let subId      = uid(FormOptions.findOne(id).subOptions)
		FormOptions.update(id, {$push: {subOptions: new SubOption(subId)}})
	},


	/**
	 * SubOption Update
	 */
	'keyup .sub-option > input' (e, t) {
		let id         = $(e.target).closest('.form-option').attr("data-id")
		let subId      = $(e.target).closest('.sub-option').attr("data-id")
		let key        = $(e.target).attr("class")
		let value      = $(e.target).val()

		if (key == 'cost') value = Number(value)

		let subOptions = FormOptions.findOne(id).subOptions
		let updated    = updateProperty(subId, key, value, subOptions)

		FormOptions.update(id, {$set: {subOptions: updated}})
	}
})
