/**
 * Swaps two elements
 */
export function swap (a, b, array)
{
	const temp = array[a]
	array[a] = array[b]
	array[b] = array[a]
}

/**
 * Prevent default action when value is non-numeric
 */
export function preventNonNumeric (value)
{
	if (!$.isNumeric(value))
		return value.slice(0, value.length - 1)
	else
		return value
}

/**
 * Generate a new unique identifier based on _id property of items
 */
export function uid (array)
{
	const max = array
		.map(item => item._id)
		.sort((a, b) => a - b)
		.slice(-1)

	const uid = Number(max) + 1
	return uid.toString()
}


/**
 * Updates a property of an object in an array
 */
export function updateProperty (id, key, value, array)
{
	return array.map(item => item._id == id ? {...item, [key]: value} : item)
}

/**
 * Process form values
 */
export function filterObject (filter, object)
{
	const remainingKeys = Object.keys(object).filter((key) => filter(key, object[key]))
	return remainingKeys.reduce((sum, key) => Object.assign(sum, {[key]: object[key]}), {})
}

export function processForm (fields, collection)
{
	const formOptions = _.values(filterObject(isFormOption, fields))
	const other				= filterObject(isOther, fields)

	return {...other, formOptions}
}


function isFormOption (field)
{
	if (field != 'name' && field != 'email' && field != 'notes')
		return true
	else
		return false
}

function isOther (field)
{
	return !isFormOption(field)
}

function isOn (_, value)
{
	return value == 'on'
}

/**
 * Filter sub-options
 */
export function filterSubOptions (checkedIds, formOptionsFromDB)
{
	return formOptionsFromDB.map(fo => Object.assign(fo, {subOptions: fo.subOptions.filter(so => checkedIds.includes(so._id))}))
}


/**
 * Cost calculation
 */
export function calculateCost (formOptions)
{
	return formOptions.reduce((sum, formOption) => {
		return sum + formOption.cost + formOption.subOptions.reduce((sum, subOption) => {
			return sum + subOption.cost
		}, 0)
	}, 0)
}
