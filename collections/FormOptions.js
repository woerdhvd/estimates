/**
 * A single form option.
 * Order will be determined by array index
 */
export function FormOption ()
{
		this.cost = 0
		this.name = ""
		this.description = ""
		this.subOptions = []
}

/**
 * Additional option.
 */
export function SubOption (_id)
{
		this.cost = 0
		this.name = ""
		this._id  = _id || 0
}

export const FormOptions = new Mongo.Collection('formoptions')

export const fixtures =
[
	new FormOption(),
	new FormOption(),
	new FormOption()
]
