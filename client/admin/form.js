import { Accounts } from 'meteor/accounts-base'
import { Template } from 'meteor/templating'

import 'nestedSortable'
import { SubOption, FormOption, FormOptions } from '../../collections/FormOptions'
import { uid, updateProperty } from '../../utils'

Template.form.rendered = function () {
	$('#form-options').sortable({items: 'li'})
}

Template.form.helpers({
	formoptions: _ => FormOptions.find().fetch()
})


Template.form.events({
	'click .new' () {
		FormOptions.insert(new FormOption())
	},

	'sort .form-option' (e) {
		console.log(e)
	},

	'keyup .form-option > input, keyup .form-option > textarea' (e, t) {
		let id         = $(e.target).parent().attr("data-id")
		let key        = $(e.target).attr("class")
		let value      = $(e.target).val()

		if (key == 'cost') value = Number(value)

		FormOptions.update(id, {$set: {[key]: value}})
	},

	'keyup .sub-option > input' (e, t) {
		let id         = $(e.target).closest('.form-option').attr("data-id")
		let subId      = $(e.target).closest('.sub-option').attr("data-id")
		let key        = $(e.target).attr("class")
		let value      = $(e.target).val()

		if (key == 'cost') value = Number(value)

		let subOptions = FormOptions.findOne(id).subOptions
		let updated    = updateProperty(subId, key, value, subOptions)

		FormOptions.update(id, {$set: {subOptions: updated}})
	},

	'click .remove' (e) {
		let id         = $(e.target).parent().attr("data-id")
		FormOptions.remove(id)
	},

	'click .add-suboption' (e) {
		let id         = $(e.target).parent().attr("data-id")
		let subId      = uid(FormOptions.findOne(id).subOptions)
		FormOptions.update(id, {$push: {subOptions: new SubOption(subId)}})
	}


	// Reorder

})
