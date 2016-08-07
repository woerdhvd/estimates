import {Meteor} from 'meteor/meteor'
import {Template} from 'meteor/templating'
import {Estimates} from '../../collections/Estimates'
import {calculateCost} from '../../utils'

Template.estimatedetail.onCreated(function () {
	console.log(this)
})

Template.estimatedetail.helpers({

})


Template.estimatedetail.events({

})
