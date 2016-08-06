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
