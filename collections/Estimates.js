/**
 * A single estimate.
 * It holds a copy of the chosen form options at the time.
 */
export function Estimate ({name, email, notes}, formoptions)
{
		this.name        = name
		this.email       = email
		this.date        = new Date()
		this.formoptions = formoptions
		this.notes       = notes || ""
}

export const Estimates = new Mongo.Collection('estimates')
