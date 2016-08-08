import {Meteor} from 'meteor/meteor'
import {Template} from 'meteor/templating'
import dateFormat from 'dateformat'
import {Estimates} from '../../collections/Estimates'
import {calculateCost} from '../../utils'

Template.estimatedetail.helpers({
  // estimate: 		 _ => Estimates.findOne(._id),
  estimatedCost: calculateCost,
  dateFormat: 	 date => dateFormat(date, "fullDate")
})


Template.estimatedetail.events({
  'click .remove' (e) {
    Estimates.remove(this._id)
    Router.go('/admin/estimates')
  }
})
