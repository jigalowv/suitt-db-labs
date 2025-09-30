<style>
    th, table.my-table {
        border: 1px solid black;
    }

    .attribute, .long-line, th {
        text-align: center;
    }

    td {
        border: 1px dotted;
    }
</style>

<table class="my-table">
    <thead>
        <tr>
            <th>властивість</th>
            <th>опис</th>
            <th>обмеження</th>
        </tr>
    </thead>
    <tbody>
        <tr>
        <th colspan="3">member (користувач)</th></tr>
        <tr>
            <td class="attribute">m_id</td>
            <td>Ідентифікатор користувача</td>
            <td>первинний ключ.<br/>UUID</td>
        </tr>
        <tr>
            <td class="attribute">m_login</td>
            <td>Логін користувача</td>
            <td>до 255 символів.<br/>не порожній.<br/>унікальний.</td>
        </tr>
        <tr>
            <td class="attribute">m_email</td>
            <td>Email користувача</td>
            <td>до 255 символів.<br/>не порожній<br/>унікальний</td>
        </tr>
        <tr>
            <td class="attribute">m_phc</td>
            <td>Хеш пароля</td>
            <td>не порожній</td>
        </tr>
        <tr>
            <td class="attribute">m_registration_dt</td>
            <td>Дата реєстрації</td>
            <td>timestamp.<br/>не порожній.</td>
        </tr>
            <tr><th colspan="3">performer (виконавець)</th></tr>
        <tr>
            <td class="attribute">member_id</td>
            <td>Ідентифікатор користувача-виконавця</td>
            <td>первинний ключ<br/>FK → member.m_id<br/>не порожній</td>
        </tr>
        <tr>
            <td class="attribute">expected_income_id</td>
            <td>Діапазон очікуваного доходу</td>
            <td>FK → income_range.ir_id<br/>не порожній</td>
        </tr>
        <tr>
            <td class="attribute">p_experience</td>
            <td>Досвід роботи</td>
            <td>ціле число<br/>>= 0</td>
        </tr>
        <tr>
            <td class="attribute">p_resume</td>
            <td>Резюме</td>
            <td>текст<br/>не порожній</td>
        </tr>
        <tr>
            <td class="attribute">p_promoted_at</td>
            <td>Дата підняття у пошуку</td>
            <td>timestamp</td>
        </tr>
        <tr>
        <th colspan="3">customer (замовник)</th></tr>
        <tr>
            <td class="attribute">member_id</td>
            <td>Ідентифікатор користувача-замовника</td>
            <td>первинний ключ<br/>FK → member.m_id<br/>не порожній</td>
        </tr>
        <tr>
        <th colspan="3">order (завдання)</th></tr>
        <tr>
            <td class="attribute">o_id</td>
            <td>Ідентифікатор завдання</td>
            <td>первинний ключ</td>
        </tr>
        <tr>
            <td class="attribute">customer_id</td>
            <td>Замовник</td>
            <td>FK → customer.member_id<br/>не порожній</td>
        </tr>
        <tr>
            <td class="attribute">income_range_id</td>
            <td>Діапазон оплати</td>
            <td>FK → income_range.ir_id<br/>не порожній</td>
        </tr>
        <tr>
            <td class="attribute">o_title</td>
            <td>Заголовок завдання</td>
            <td>до 255 символів.<br/>не порожній</td>
        </tr>
        <tr>
            <td class="attribute">o_description</td>
            <td>Опис завдання</td>
            <td>текст.<br/>не порожній</td>
        </tr>
        <tr>
            <td class="attribute">o_status</td>
            <td>Статус завдання</td>
            <td>order_status.<br/>не порожній</td>
        </tr>
        <tr>
            <td class="attribute">o_created_at</td>
            <td>Дата створення</td>
            <td>timestamp.<br/>не порожній</td>
        </tr>
        <tr>
            <td class="attribute">o_updated_at</td>
            <td>Дата останнього оновлення</td>
            <td>timestamp</td>
        </tr>
        <tr>
            <td class="attribute">o_deadline</td>
            <td>Крайній термін</td>
            <td>timestamp</td>
        </tr>
        <tr>
            <td class="attribute">o_promoted_at</td>
            <td>Дата підняття у пошуку</td>
            <td>timestamp</td>
        </tr>
        <td class="long-line" colspan='3'>(performer_id, skill_id) - <b>unique</b></td>
        <tr><th colspan="3">skill (навичка)</th></tr>
        <tr>
            <td class="attribute">s_id</td>
            <td>Ідентифікатор навички</td>
            <td>первинний ключ</td>
        </tr>
        <tr>
            <td class="attribute">s_title</td>
            <td>Назва навички</td>
            <td>до 255 символів.<br/>не порожня.<br/>унікальна</td>
        </tr>
        <tr>
        <th colspan="3">required_skill (необхідна навичка)</th></tr>
        <tr>
            <td class="attribute">rs_id</td>
            <td>Ідентифікатор</td>
            <td>первинний ключ</td>
        </tr>
        <tr>
            <td class="attribute">order_id</td>
            <td>Завдання</td>
            <td>FK → order.o_id.<br/>не порожній</td>
        </tr>
        <tr>
            <td class="attribute">skill_id</td>
            <td>Навичка</td>
            <td>FK → skill.s_id.<br/>не порожній</td>
        </tr>
        <td class="long-line" colspan='3'>(order_id, skill_id) - <b>unique</b></td>
        <tr>
        <th colspan="3">performer_skill (навичка виконавця)</th></tr>
        <tr>
            <td class="attribute">ps_id</td>
            <td>Ідентифікатор</td>
            <td>первинний ключ</td>
        </tr>
        <tr>
            <td class="attribute">performer_id</td>
            <td>Виконавець</td>
            <td>FK → performer.member_id.<br/>не порожній</td>
        </tr>
        <tr>
            <td class="attribute">skill_id</td>
            <td>Навичка виконавця</td>
            <td>FK → skill.s_id.<br/>не порожній</td>
        </tr>
        <tr>
        <th colspan="3">income_range (діапазон доходу)</th></tr>
        <tr>
            <td class="attribute">ir_id</td>
            <td>Ідентифікатор</td>
            <td>первинний ключ</td>
        </tr>
        <tr>
            <td class="attribute">ir_min</td>
            <td>Мінімальний дохід</td>
            <td>decimal(12,2).<br/>>= 0.<br/>не порожній</td>
        </tr>
        <tr>
            <td class="attribute">ir_max</td>
            <td>Максимальний дохід</td>
            <td>decimal(12,2).<br/>>= ir_min.<br/>не порожній</td>
        </tr>
        <tr>
        <th colspan="3">contact_type (тип контакту)</th></tr>
        <tr>
            <td class="attribute">ct_id</td>
            <td>Ідентифікатор типу контакту</td>
            <td>первинний ключ</td>
        </tr>
        <tr>
            <td class="attribute">ct_title</td>
            <td>Назва типу контакту</td>
            <td>до 255 символів.<br/>не порожня.<br/>унікальна</td>
        </tr>
        <tr>
        <th colspan="3">contact (контакт)</th></tr>
        <tr>
            <td class="attribute">c_id</td>
            <td>Ідентифікатор контакту</td>
            <td>первинний ключ</td>
        </tr>
        <tr>
            <td class="attribute">member_id</td>
            <td>Користувач</td>
            <td>FK → member.m_id.<br/>не порожній</td>
        </tr>
        <tr>
            <td class="attribute">contact_type_id</td>
            <td>Тип контакту</td>
            <td>FK → contact_type.ct_id.<br/>не порожній</td>
        </tr>
        <tr>
            <td class="attribute">c_value</td>
            <td>Значення контакту</td>
            <td>до 255 символів.<br/>не порожній</td>
        </tr>
        <tr>
        <th colspan="3">perform_request (запит на виконання)</th></tr>
        <tr>
            <td class="attribute">pr_id</td>
            <td>Ідентифікатор запиту</td>
            <td>первинний ключ</td>
        </tr>
        <tr>
            <td class="attribute">order_id</td>
            <td>Завдання</td>
            <td>FK → order.o_id.<br/>не порожній</td>
        </tr>
        <tr>
            <td class="attribute">performer_id</td>
            <td>Виконавець</td>
            <td>FK → performer.member_id.<br/>не порожній</td>
        </tr>
        <tr>
            <td class="attribute">pr_created_at</td>
            <td>Дата створення</td>
            <td>timestamp.<br/>не порожній</td>
        </tr>
        <tr>
            <td class="attribute">pr_status</td>
            <td>Статус запиту</td>
            <td>request_status.<br/>не порожній</td>
        </tr>
        <tr>
            <td class="long-line" colspan='3'>(order_id, performer_id) - <b>unique</b></td>
        </tr>
        <tr>
        <th colspan="3">comment (коментар)</th></tr>
        <tr>
            <td class="attribute">c_id</td>
            <td>Ідентифікатор коментаря</td>
            <td>первинний ключ</td>
        </tr>
        <tr>
            <td class="attribute">finished_order_id</td>
            <td>Завершене завдання</td>
            <td>FK → order.o_id.<br/>не порожній</td>
        </tr>
        <tr>
            <td class="attribute">c_from</td>
            <td>Автор коментаря</td>
            <td>FK → member.m_id.<br/>не порожній</td>
        </tr>
        <tr>
            <td class="attribute">c_to</td>
            <td>Отримувач коментаря</td>
            <td>FK → member.m_id.<br/>не порожній</td>
        </tr>
        <tr>
            <td class="attribute">c_content</td>
            <td>Текст коментаря</td>
            <td>текст.<br/>не порожній</td>
        </tr>
        <tr>
            <td class="attribute">c_created_at</td>
            <td>Дата створення</td>
            <td>timestamp.<br/>не порожній</td>
        </tr>
        <tr>
            <td class="attribute">c_type</td>
            <td>Тип коментаря</td>
            <td>comment_type.<br/>не порожній</td>
        </tr>
    </tbody>
</table>