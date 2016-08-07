import {Accounts} from 'meteor/accounts-base'
import {Template} from 'meteor/templating'
import sortable from 'html5sortable'
import {SubOption, FormOption, FormOptions} from '../../collections/FormOptions'
import {uid, updateProperty, getFieldAttributes} from '../../utils'


/**
 * Reorder FormOptions
 */

const reload			= _ => sortable('#form-options')[0].addEventListener('sortupdate', updateOrder)
const updateOrder = ({detail}) => Meteor.call('swapOrder', detail.index, detail.oldindex)


Template.form.rendered = reload


Template.form.helpers({
	formoptions: _ => FormOptions.find({}, {sort: {order: 1}})
})


Template.form.events({

	/**
	 * Add/Remove
	 * - set the order to be the last item in the collection
	 */
	'click .new' () {
		FormOptions.insert(new FormOption(FormOptions.find().count()))
		reload()
	},

	'click .form-option > .remove' (e) {
		const {id}   = getFieldAttributes(e.target)
		FormOptions.remove(id)
		reload()
	},

	/**
	 * Update
	 */
	'keyup .form-option > input, keyup .form-option > textarea' (e, t) {
		const {id, key, value} = getFieldAttributes(e.target)

		FormOptions.update(id, {$set: {[key]: value}})
	},


	/**
	 * SubOption Add/Remove
	 */
	'click .add-suboption' (e) {
		const {id} 		 = getFieldAttributes(e.target)
		let subId      = uid(FormOptions.findOne(id).subOptions)
		FormOptions.update(id, {$push: {subOptions: new SubOption(subId)}})
	},

	'click .sub-option > .remove' (e) {
		const {id, subId} = getFieldAttributes(e.target)
		FormOptions.update(id, {$pull: {subOptions: {_id: subId}}})
	},


	/**
	 * SubOption Update
	 */
	'keyup .sub-option > input' (e, t) {
		const {id, subId, key, value} = getFieldAttributes(e.target)

		let subOptions = FormOptions.findOne(id).subOptions
		let updated    = updateProperty(subId, key, value, subOptions)

		FormOptions.update(id, {$set: {subOptions: updated}})
	}
})
