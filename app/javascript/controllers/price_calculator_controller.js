// app/javascript/controllers/price_calculator_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["startDate", "endDate", "price"]
  static values = { disasterPrice: Number }

  connect() {
    this.updatePrice()
    console.log("PRICE")
  }

  updatePrice() {
    const start = this.startDateTarget.value
    console.log(start)
    const end = this.endDateTarget.value
    console.log(end)
    if (!start || !end) return

    const startDate = new Date(start)
    const endDate = new Date(end)
    const diffTime = endDate - startDate
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24))
    console.log(diffDays)

    if (diffDays > 0) {
      const totalPrice = diffDays * this.disasterPriceValue
      this.priceTarget.textContent = `$${totalPrice}`
    } else {
      this.priceTarget.textContent = "$0.00"
    }
  }
}
