import { Meteor } from 'meteor/meteor'
import { Template } from 'meteor/templating'
import getFormData from 'get-form-data'
import { FormOptions } from '../../collections/FormOptions'
import { Estimate, Estimates } from '../../collections/Estimates'
import { processForm, filterSubOptions } from '../../utils'
import './customer.html'

Template.customer.onCreated(function () {
	// this.checkedIds = new ReactiveArray()
})

Template.customer.helpers({
	formoptions: _ => FormOptions.find().fetch()
})


Template.customer.events({
	'click input[type="checkbox"]' (e, t) {
		// t.checkedIds.
	},

	'submit form' (e) {
		e.preventDefault()
		let formData 		= processForm(getFormData(e.target))
		let formOptions = FormOptions.find({_id: {$in: formData.formOptions}}).fetch()
		formOptions     = filterSubOptions(formData.formOptions, formOptions)

		Estimates.insert(new Estimate(formData, formOptions))
	}
})
