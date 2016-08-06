/**
 * A single estimate.
 * It holds a copy of the chosen form options at the time.
 */
export function Estimate (name, email, formoptions, notes)
{
    this.name = name
    this.email = email
    this.formoptions = formoptions
    this.notes = notes || ""
}

export const Estimates = new Mongo.Collection('estimates')
