import {Meteor} from 'meteor/meteor'
import {Template} from 'meteor/templating'
import {Estimates} from '../../collections/Estimates'
import {calculateCost} from '../../utils'

Template.estimates.helpers({
	estimates () {
		return Estimates.find().fetch()
	},

	estimatedCost (formOptions) {
		return calculateCost(formOptions)
	}
})


Template.estimates.events({
	'click article' (e) {
		const _id = $(e.target).attr('data-id')
		Router.go(`/admin/estimates/${_id}`)
	}
})
