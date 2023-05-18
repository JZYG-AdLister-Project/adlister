`use strict`;

//Arrow IIFE
(() => {
	const adCardsParent = document.querySelector('.ad-cards');

	// Event listener for the edit button
	adCardsParent.addEventListener('click', (event) => {
		if (event.target.className === ('edit')) {
			editButton();
		}
	});

	const editButton = () => {
		const editTitle = event.target.parentElement.previousElementSibling.previousElementSibling.previousElementSibling;
		const editDescription = event.target.parentElement.previousElementSibling.children[3];
		const currentTitle = event.target.parentElement.previousElementSibling.previousElementSibling.previousElementSibling;
		console.log(currentTitle)
		const currentDescription = event.target.parentElement.previousElementSibling.children[0];
		console.log(currentDescription)
		const deleteDoneRow = event.target.parentElement.nextElementSibling;
		console.log(deleteDoneRow)

		editTitle.classList.toggle('invisible');
		editDescription.classList.toggle('invisible');
		currentTitle.classList.add('invisible');
		currentDescription.classList.toggle('invisible');
		deleteDoneRow.classList.toggle('invisible');

	}

})();