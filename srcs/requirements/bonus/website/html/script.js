document.getElementById('userForm').addEventListener('submit', async (event) => {
    event.preventDefault();

    const login = document.getElementById('login').value;
    const token = await getAccessToken();
    
    if (token) {
        const profileData = await fetchProfileData(login, token);
        displayProfileInfo(profileData);
    }
});

async function getAccessToken() {
    const response = await fetch('https://api.intra.42.fr/oauth/token', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'grant_type=client_credentials&client_id=u-s4t2ud-0cc8d7dabfcf889f3546e10da1a126586c6b8826bfdb16bebccbf186e88beb8f&client_secret=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'
    });

    if (!response.ok) {
        console.error('トークンの取得に失敗しました');
        return null;
    }

    const data = await response.json();
    return data.access_token;
}

async function fetchProfileData(login, token) {
    const response = await fetch(`https://api.intra.42.fr/v2/users/${login}`, {
        headers: {
            'Authorization': `Bearer ${token}`
        }
    });

    if (!response.ok) {
        console.error('プロフィールデータの取得に失敗しました');
        return null;
    }

    return await response.json();
}

function displayProfileInfo(data) {
    if (!data) {
        document.getElementById('profileInfo').innerText = 'データがありません';
        return;
    }

    const profileInfo = `
        <h2>${data.displayname}</h2>
        <img src="${data.image.link}" alt="${data.displayname}" class="profile-image" />
        <p>ID: ${data.id}</p>
        <p>Email: ${data.email}</p>
        <p>Login: ${data.login}</p>
        <p>Correction Point: ${data.correction_point}</p>
        <p>Pool Month: ${data.pool_month}</p>
        <p>Pool Year: ${data.pool_year}</p>
    `;

    document.getElementById('profileInfo').innerHTML = profileInfo;
}
