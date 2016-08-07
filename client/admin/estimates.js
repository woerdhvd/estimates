import {Meteor} from 'meteor/meteor'
import {Template} from 'meteor/templating'
import dateFormat from 'dateformat'
import {Estimates} from '../../collections/Estimates'
import {calculateCost, getEstimateId} from '../../utils'

Template.estimates.helpers({
	estimates: 		 _ 					 => Estimates.find().fetch(),
	estimatedCost: formOptions => calculateCost(formOptions),
	dateFormat: 	 date 			 => dateFormat(date, "fullDate")
})


Template.estimates.events({
	'click article' (e) {
		const id = getEstimateId(e.target)
		Router.go(`/admin/estimates/${id}`)
	},

	'click .email a' (e) {
		e.stopPropagation()
	},

	'click .remove' (e) {
		e.stopPropagation()
		const id = getEstimateId(e.target)
		Estimates.remove(id)
		Router.go('/admin/estimates')
	}
})
