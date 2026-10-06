def create_prompt(data, create_table, ptr):

    final_prompt = ""
    for i in range(len(data)):
        if i != ptr:
            final_prompt=final_prompt + data[i]
            # print(final_prompt)
        elif i == ptr:
            if len(data[i])>0:
                final_prompt += "Table Schema:"

            for j in data[i]:
                final_prompt = final_prompt +"\n"+create_table[j]

    return final_prompt