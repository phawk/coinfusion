module FormHelper
  def input_class
    "placeholder:text-slate-400 text-slate-700 border-2 py-2.5 px-4 border-slate-200 bg-slate-50 rounded-xl w-full text-lg sm:text-xl focus:border-purple-400 focus:ring-purple-400"
  end

  def button_class
    "bg-gradient-to-r from-purple-500 to-pink-500 text-white rounded-xl py-2.5 px-4 text-center text-lg sm:text-xl font-semibold w-full hover:bg-gradient-to-tr"
  end

  def radio_button_class
    "checked:bg-pink-500"
  end
end
