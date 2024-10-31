let count = 0;

function getRandomPosition() {
    const x = Math.random() * (window.innerWidth - 100);
    const y = Math.random() * (window.innerHeight - 100);
    return { x, y };
}

function moveImage() {
    const image = document.getElementById('movableImage');
    const { x, y } = getRandomPosition();
    image.style.left = `${x}px`;
    image.style.top = `${y}px`;
}

document.getElementById('movableImage').addEventListener('click', () => {
    count++;
    document.getElementById('clickCount').innerText = count;
    moveImage();
});

moveImage();
