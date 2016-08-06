import { Accounts } from 'meteor/accounts-base'
import { Template } from 'meteor/templating'
import { SubOption, FormOption, FormOptions } from '../../collections/FormOptions'
import { uid } from '../../utils'

Template.form.created = function () {

}

Template.form.helpers({
	formoptions () {
		return FormOptions.find().fetch()
	},

	isNumeric: $.isNumeric
})

Template.form.events({
	'click .new' () {
		FormOptions.insert(new FormOption())
	},

	'keyup input, keyup textarea' (e, t) {
		let id 		= $(e.target).parent().attr("data-id")
		let key 	= $(e.target).attr("class")
		let value = $(e.target).val()
		FormOptions.update(id, {$set: {[key]: value}})
	},

	'click .remove' (e) {
		let id 		= $(e.target).parent().attr("data-id")
		FormOptions.remove(id)
	},

	'click .add-suboption' (e) {
		let id 		= $(e.target).parent().attr("data-id")
		let subId = uid(FormOptions.findOne(id).subOptions)
		FormOptions.update(id, {$push: {subOptions: new SubOption(subId)}})
	}

})
