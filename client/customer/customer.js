import { Meteor } from 'meteor/meteor'
import { Template } from 'meteor/templating'
import getFormData from 'get-form-data'
import { FormOptions } from '../../collections/FormOptions'
import { Estimate, Estimates } from '../../collections/Estimates'
import { processForm, filterSubOptions } from '../../utils'
import './customer.html'

Template.customer.onRendered(() => $('form').validate())

Template.customer.helpers({
	formoptions: _ => FormOptions.find({}, {sort: {order: 1}})
})


Template.customer.events({
	'submit form' (e) {
		e.preventDefault()
		let formData 		= processForm(getFormData(e.target))
		let formOptions = FormOptions.find({_id: {$in: formData.formOptions}}).fetch()
		formOptions     = filterSubOptions(formData.formOptions, formOptions)

		const estimate = new Estimate(formData, formOptions)
		Estimates.insert(estimate)

		Meteor.call('sendMail', estimate)
		Router.go('/submit')
	}
})
